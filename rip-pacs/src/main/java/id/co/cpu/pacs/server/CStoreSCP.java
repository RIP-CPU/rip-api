package id.co.cpu.pacs.server;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dcm4che3.data.Attributes;
import org.dcm4che3.data.Tag;
import org.dcm4che3.data.VR;
import org.dcm4che3.io.DicomOutputStream;
import org.dcm4che3.net.Association;
import org.dcm4che3.net.PDVInputStream;
import org.dcm4che3.net.pdu.PresentationContext;
import org.dcm4che3.net.service.BasicCStoreSCP;
import org.dcm4che3.util.SafeClose;

import com.google.common.eventbus.EventBus;

import id.co.cpu.pacs.event.ImageStreamEvent;

public final class CStoreSCP extends BasicCStoreSCP {

	protected final Log LOGGER = LogFactory.getLog(getClass());
    private int status;
    public EventBus eventBus;
    private static final String DCM_EXT = ".dcm";
	
    public CStoreSCP(EventBus eventBus) {
        super("*");
        this.eventBus = eventBus;
    }
    
    @Override
    protected void store(Association as, PresentationContext pc, Attributes rq, PDVInputStream data, Attributes rsp) throws IOException {
    	File file = null;
        try {
	        rsp.setInt(Tag.Status, VR.US, status);
	        String ipAddress = as.getSocket().getInetAddress().getHostAddress();
	        String aeTitle = as.getApplicationEntity().getAETitle();
	        String aePath = as.getApplicationEntity().getDescription();
	        Integer aePort = as.getApplicationEntity().getConnections().get(0).getPort();
	        String associationName = as.toString();
	        String cuid = rq.getString(Tag.AffectedSOPClassUID);
	        String iuid = rq.getString(Tag.AffectedSOPInstanceUID);
	        String tsuid = pc.getTransferSyntax();

            Path path = Files.createTempFile(iuid, DCM_EXT);
            file = path.toFile();
	        DicomOutputStream out = new DicomOutputStream(file);
	        try {
	            out.writeFileMetaInformation(as.createFileMetaInformation(iuid, cuid, tsuid));
	            data.copyTo(out);
	        } finally {
	            SafeClose.close(out);
	        }
        	eventBus.post(new ImageStreamEvent(null, file, ipAddress, aeTitle, aePath, aePort, associationName, cuid, iuid, tsuid));
        } catch (Exception e) {
            LOGGER.error("Dicom Store Exception: " + e.getMessage());        
        }
    }

	public EventBus getEventBus() {
		return eventBus;
	}

	public void setEventBus(EventBus eventBus) {
		this.eventBus = eventBus;
	}

    public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
    
}