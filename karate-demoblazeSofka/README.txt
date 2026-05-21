***************************************************************
 README - AUTOMATIZACION DE PRUEBAS REST: DemoBlaze
 Pruebas de servicios Signup y Login
***************************************************************

1. TECNOLOGIAS Y VERSIONES REQUERIDAS

  - Java (JDK)      : 17 LTS
  - Apache Maven    : 3.8.x o superior
  - Karate Framework: 1.5.0
  - JUnit           : 5 

2. EJECUCION DESDE ENTORNO DE DESAROLLO

  2.1 Abrir el proyecto:
      File > Open > seleccionar la carpeta karate-demoblaze

  2.2 Esperar a que se descargue las dependencias
      de Maven automaticamente (barra de progreso abajo).
      Si no lo hace automáticamente:
      Clic derecho sobre pom.xml > Maven > Reload

  2.3 Opciones de ejecucion:

      OPCION A — Ejecutar todos los tests a la vez:
        Clic derecho sobre ExamplesTest.java > Run 'ExamplesTest'

      OPCION B — Ejecutar solo los tests de login:
        Clic derecho sobre LoginRunner.java > Run 'LoginRunner'

      OPCION C — Ejecutar solo los tests de signup:
        Clic derecho sobre SignupRunner.java > Run 'SignupRunner'

      OPCION D — Ejecutar un feature directamente:
        Abrir login.feature o signup.feature
        Clic en el ícono verde junto a cada Scenario

  2.4 Ver resultados:
      - El reporte HTML de Karate se genera automáticamente en:
        target/karate-reports/karate-summary.html
        Abrirlo en cualquier navegador.

3. EJECUCION DESDE CONSOLA

  3.1 Abrir una terminal y navegar a la carpeta del proyecto:
        
	cd /ruta/karate-demoblaze

  3.2 Ejecutar todos los tests:

        mvn test

  3.3 Ejecutar solo los tests de login:

        mvn test -Dtest=LoginRunner

  3.4 Ejecutar solo los tests de signup:

        mvn test -Dtest=SignupRunner

  3.5 Ver el reporte HTML generado:

        target/karate-reports/karate-summary.html
***************************************************************

