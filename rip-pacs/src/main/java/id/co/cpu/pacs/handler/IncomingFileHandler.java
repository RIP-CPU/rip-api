package id.co.cpu.pacs.handler;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.eventbus.AllowConcurrentEvents;
import com.google.common.eventbus.EventBus;
import com.google.common.eventbus.Subscribe;

import id.co.cpu.pacs.component.ActiveDicoms;
import id.co.cpu.pacs.event.NewFileEvent;
import id.co.cpu.pacs.server.DicomReader;
import id.co.cpu.pacs.service.DicomBuilderService;



public class IncomingFileHandler {

	protected final Log LOGGER = LogFactory.getLog(getClass());
		
	@Autowired(required = true)
	private EventBus eventBus;
	
	@Autowired
	private DicomBuilderService dbService;
	
	@Autowired
	private ActiveDicoms activeDicoms;
		
	@Transactional
	@Subscribe
    @AllowConcurrentEvents
    public void handleIncomingFileEvent(NewFileEvent newFileEvent) {
    	//IMPORTANT! Write everything inside try catch, the guava breaks if an exception occurs
		
		try{
			File file = newFileEvent.getFile();//get the file from event handler
			DicomReader reader = new DicomReader(file);			
			
			//LOG.info("Active Dicoms:{} Received Patient Name:{} ID:{} Age:{} Sex:{} ", activeDicoms.toString(), reader.getPatientName(), reader.getPatientID(), reader.getPatientAge(), reader.getPatientSex());
			synchronized(dbService){
				dbService.buildEntities(reader, file);//lets build our dicom database entities
			}
			
			
		}catch(Exception e){
			LOGGER.error(e.getMessage());
		}
	}
	
	@PostConstruct
    public void postConstruct(){
        eventBus.register(this);       
    }

    @PreDestroy
    public void preDestroy(){
        eventBus.unregister(this);
    }
	
	public void printStats(String status) {
		//String str = Thread.currentThread().getName().split("@@")[0];
		//Thread.currentThread().setName(String.valueOf(Thread.currentThread().getId()));
		LOGGER.info(String.format("%d %s %s [Active Threads: %d] ",Thread.currentThread().getId(), Thread.currentThread().getName(), status, Thread.activeCount()));
	}
}
