@RestResource(urlMapping = '/mycustomendpoint/*')
global with sharing class REST_CustomEndpoint {
    @HttpGet
    global static String getEndpoint() {
        return 'Hello World';
    }
}