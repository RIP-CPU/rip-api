package id.co.cpu.pacs.handler;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.eventbus.AllowConcurrentEvents;
import com.google.common.eventbus.EventBus;
import com.google.common.eventbus.Subscribe;

import id.co.cpu.pacs.event.ImageStreamEvent;
import id.co.cpu.pacs.server.DicomReader;
import id.co.cpu.pacs.service.DicomBuilderService;

public class IncomingFileHandler {

	protected final Log LOGGER = LogFactory.getLog(getClass());
		
	@Autowired(required = true)
	private EventBus eventBus;
	
	@Autowired
	private DicomBuilderService dbService;
		
	@Transactional
	@Subscribe
    @AllowConcurrentEvents
    public void handleIncomingFileEvent(ImageStreamEvent imageStream) {
		try{
			DicomReader reader = new DicomReader(imageStream);
			synchronized(dbService){
				dbService.buildEntities(reader, imageStream);
			}
		}catch(Exception e){
			e.printStackTrace();
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
		LOGGER.info(String.format("%d %s %s [Active Threads: %d] ",Thread.currentThread().getId(), Thread.currentThread().getName(), status, Thread.activeCount()));
	}
}
