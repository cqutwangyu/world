package com.wangyu.world.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages = "com.wangyu.world")
public class WorldGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(WorldGatewayApplication.class, args);
    }

}
