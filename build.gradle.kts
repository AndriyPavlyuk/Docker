plugins { 
  java
  eclipse
}

allprojects {
   group = "it.discovery"
}

subprojects {  
   apply(plugin = "java")

   java.sourceCompatibility = JavaVersion.VERSION_14
   java.targetCompatibility = JavaVersion.VERSION_14

   repositories {
     jcenter()
   }

   dependencies {
      implementation(platform("org.springframework.boot:spring-boot-dependencies:2.3.3.RELEASE"))
   }  
}

