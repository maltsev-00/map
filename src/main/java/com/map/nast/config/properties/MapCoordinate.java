package com.map.nast.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties("map.coordinate")
@Data
public class MapCoordinate {
    private Double x;
    private Double y;
}
