 dependencies {
    compile("org.springframework.boot:spring-boot-starter-data-jpa")
    testCompile("org.springframework.boot:spring-boot-starter-test")

    compileOnly("org.projectlombok:lombok")
    annotationProcessor("org.projectlombok:lombok:1.18.12")

    testCompile("org.testcontainers:junit-jupiter:1.14.3")
    testCompile("org.testcontainers:mysql:1.14.3")
    runtime("mysql:mysql-connector-java")
 } 
tasks.test {
   useJUnitPlatform()
}


