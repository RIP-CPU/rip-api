package id.co.cpu.feign.dto.notification;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailNotificationDto {

    private String from;

    private String to;

    private String subject;

    /**
     * tidak usah diisi jika body emailnya menggunakan template
     */
    private String content;

    /**
     * tidak usah diisi jika body emailnya cukup content String
     */
    private String fileTemplate;

    /**
     * tidak usah diisi jika body emailnya cukup content String
     */
    private Map<String, Object> bodyTemplate;

}
