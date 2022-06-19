# System design

## Tools

1. Azure data lake storage Gen 2
2. Kafka
3. Event hub
4. Azure functions
5. Databricks
6. Azure synapse
7. PowerBI
8. Azure Active directory
9. Image processor

## Approach

1. We use azure cloud services to process and store the image and image classifications information
2. When user connect to the web application, they are authenticated through azure active directory
3. Upon successful login, uses can upload the image to web application
4. Once the image uploaded, kafka streaming web application streams the image and stores into azure data lake storage. Azure data lake storage used as both data archival(7 days) and data processing
5. Once image written to azure data lake storage, event hub will automatically trigger an event with azure storage information
6. Upon receiving an event, azure function will be automatically called(input would be azure storage information)
7. Azure function will trigger the application that was developed for image classification and deployed into databricks to process the images through spark
8. Once image processed by the image processor, image characteristics stored into azure synapse.
9. PowerBI to connect to azure synapse for creating dashboard based on the requirement


## Assumptions

1. Kafka web application receives input through REST API/Web socket from web  application where user uploads image
2. Image processing application developed in python/scala/java to deploy in Spark







