package id.co.cpu.pacs.configuration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.common.eventbus.AsyncEventBus;
import com.google.common.eventbus.EventBus;

import id.co.cpu.pacs.component.ActiveDicoms;
import id.co.cpu.pacs.dao.DicomParameterRepo;
import id.co.cpu.pacs.entity.DicomParameterEntity;
import id.co.cpu.pacs.handler.IncomingFileHandler;
import id.co.cpu.pacs.server.DicomServer;

@Configuration
public class DicomServerConfiguration {
	
	@Autowired
	@Qualifier("dicomParameterRepo")
	private DicomParameterRepo dicomParameterRepo;

    /************************** Handler for incoming files works with asynchronous event bus initiated by the DicomServer ****************************/    
    @Bean // only one incoming file handler. Even we have multiple DicomServer instances, they all forward files to the same handler...
    public IncomingFileHandler incomingFileHandler(){
        return new IncomingFileHandler();
    }

    @Bean //Guava asynch event bus that initiates 100 fixed thread pool
    public EventBus asyncEventBus(){       
    	EventBus eventBus =  new AsyncEventBus(java.util.concurrent.Executors.newFixedThreadPool(100));
        return eventBus;
    }

    @Bean 
    public Map<String, DicomServer> dicomServers(){
        Map<String, DicomServer> dicomServers = new HashMap<>();
        List<DicomParameterEntity> dicomParameters = dicomParameterRepo.findAll();
        for (DicomParameterEntity dicomParameter:dicomParameters) {
            dicomServers.put(dicomParameter.getAeTitle(), DicomServer.init(dicomParameter.getDicomHost(), dicomParameter.getDicomPort(), dicomParameter.getAeTitle(), dicomParameter.getDicomStorage(), asyncEventBus()));
        }
        return dicomServers;
    }
    
    /************************** End of Handler for incoming files works with asynchronous event bus initiated by the DicomServer ****************************/    
    @Bean
    @Qualifier(value = "activeDicoms")
    public ActiveDicoms activeDicoms(){    
    	return new ActiveDicoms();    	
    }

}
