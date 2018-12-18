package id.co.cpu.pacs.configuration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.common.eventbus.AsyncEventBus;
import com.google.common.eventbus.EventBus;

import id.co.cpu.pacs.component.ActiveDicoms;
import id.co.cpu.pacs.handler.IncomingFileHandler;
import id.co.cpu.pacs.server.DicomServer;

@Configuration
public class ResourceServerPACSConfiguration {

    
    
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

    @Bean //dicom server takes storage output directory, ae title and ports. Server listens same number of ports with same ae title 
    public Map<String, DicomServer> dicomServers(@Value("${pacs.storage.dcm}") String storageDir, @Value("${pacs.aetitle}") String aeTitle, @Value("#{'${pacs.ports}'.split(',')}") List<Integer> ports){
        Map<String, DicomServer> dicomServers = new HashMap<>();
        for (int port:ports) {
            dicomServers.put("DICOM_SERVER_AT_" + port, DicomServer.init(null, port, aeTitle, storageDir, asyncEventBus()));
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
