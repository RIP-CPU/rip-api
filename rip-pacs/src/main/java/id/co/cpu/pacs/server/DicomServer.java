package id.co.cpu.pacs.server;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dcm4che3.net.ApplicationEntity;
import org.dcm4che3.net.Association;
import org.dcm4che3.net.AssociationHandler;
import org.dcm4che3.net.Connection;
import org.dcm4che3.net.Device;
import org.dcm4che3.net.State;
import org.dcm4che3.net.TransferCapability;
import org.dcm4che3.net.pdu.AAssociateAC;
import org.dcm4che3.net.pdu.AAssociateRQ;
import org.dcm4che3.net.pdu.UserIdentityAC;
import org.dcm4che3.net.service.BasicCEchoSCP;
import org.dcm4che3.net.service.DicomServiceRegistry;

import com.google.common.eventbus.EventBus;


public class DicomServer {

	protected final static Log LOGGER = LogFactory.getLog(DicomServer.class);

    private final Device device = new Device("storescp");
    private final ApplicationEntity ae = new ApplicationEntity("*");
    private final Connection conn = new Connection();
    private EventBus eventBus;

    public DicomServer(EventBus eventBus) throws IOException {
    	this.eventBus = eventBus;
    	this.device.setDimseRQHandler(createServiceRegistry());
    	this.device.addConnection(this.conn);
    	this.device.addApplicationEntity(this.ae);
    	this.device.setAssociationHandler(this.associationHandler);
    	this.ae.setAssociationAcceptor(true);
    	this.ae.addConnection(this.conn);
    }

    private DicomServiceRegistry createServiceRegistry() {
        DicomServiceRegistry serviceRegistry = new DicomServiceRegistry();
        serviceRegistry.addDicomService(new BasicCEchoSCP());
        serviceRegistry.addDicomService(new CStoreSCP(this.eventBus));
        return serviceRegistry;
    }

    public static void configureConn(Connection conn){
        conn.setReceivePDULength(Connection.DEF_MAX_PDU_LENGTH);
        conn.setSendPDULength(Connection.DEF_MAX_PDU_LENGTH);
        conn.setMaxOpsInvoked(0);
        conn.setMaxOpsPerformed(0);
    }

    public static DicomServer init(String aeHost, int aePort, String aeTitle, String aePath, EventBus eventBus) {
        LOGGER.info("Bind to: " + aeTitle + "@" + aeHost + ":" + aePort);
        DicomServer ds = null;
        try {
            ds = new DicomServer(eventBus);
            if(aeHost != null) {
                ds.conn.setHostname(aeHost);
            }
            ds.conn.setPort(aePort);
            ds.ae.setAETitle(aeTitle);
            ds.ae.setDescription(aePath);
            configureConn(ds.conn);
            //accept-unknown
            ds.ae.addTransferCapability(
                    new TransferCapability(null,
                            "*",
                            TransferCapability.Role.SCP,
                            "*"));
            ExecutorService executorService = Executors.newCachedThreadPool();
            ScheduledExecutorService scheduledExecutorService = Executors.newSingleThreadScheduledExecutor();
            ds.device.setScheduledExecutor(scheduledExecutorService);
            ds.device.setExecutor(executorService);
            ds.device.bindConnections();

        }catch (Exception e) {
            LOGGER.error(String.format("dicomserver: %s", e.getMessage()));
            e.printStackTrace();
        }
        return ds;
    }

    private AssociationHandler associationHandler = new AssociationHandler(){
		
		@Override
		protected AAssociateAC makeAAssociateAC(Association as, AAssociateRQ rq, UserIdentityAC arg2) throws IOException {
			State st = as.getState();			
			if(as != null)
				LOGGER.info(String.format("makeAAssociateAC: %s  Associate State: %s  Associate State Name: %s", as.toString(), st, st.name()));
			if(rq != null)
				LOGGER.info(String.format("Max OpsInvoked: %d  Max OpsPerformed: %d  Max PDU Length: %d  Number of Pres. Contexts: %d",rq.getMaxOpsInvoked(), rq.getMaxOpsPerformed(), rq.getMaxPDULength(), rq.getNumberOfPresentationContexts()));			
			if(arg2 != null)
				LOGGER.info(String.format("UserIdentityAC Length:%d",arg2.length()));			
			return super.makeAAssociateAC(as, rq, arg2);
		}
		
		@Override
		protected AAssociateAC negotiate(Association as, AAssociateRQ rq) throws IOException {			
			if(as != null)
				LOGGER.info(String.format("AAssociateAC negotiate: %s",as.toString()));			
			return super.negotiate(as, rq);
		}
		
		@Override
		protected void onClose(Association as) {			
			State st = as.getState();			
			if(as != null && st == State.Sta13)
				LOGGER.info(String.format("Assocation Released and Closed: %s Name: %s", as.getState(), as.toString()));
			else
				LOGGER.info("Association Closed");
			super.onClose(as);
		}
	};

}
