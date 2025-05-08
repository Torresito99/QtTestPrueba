import QtQuick 2.15
import QtTest 1.2
import TestData 1.0

Item {
    Main {
        id: mainProgram
    }

    TestCase {
        name: "LoginTests"
        when: windowShown

        function initTestCase() {
            console.log("========================================");
            console.log("Iniciando casos de prueba");
            console.log("========================================");
            console.log("Comprobando disponibilidad de TestData");
            verify(TestData !== undefined, "TestData debería estar definido");
            verify(TestData.testData !== null, "Los datos de prueba deben estar cargados");
            wait(2000);
        }

        function getCurrentTime() {
            var date = new Date();
            return date.toLocaleString();
        }

        function getTestCase(id) {
            if (!TestData.testData || !TestData.testData.tests) {
                fail("Datos de prueba no disponibles");
                return null;
            }

            const tests = TestData.testData.tests;
            for (let i = 0; i < tests.length; i++) {
                if (tests[i].id === id) {
                    return tests[i];
                }
            }
            fail("Caso de prueba no encontrado: " + id);
            return null;
        }

        function shouldRunTest(testCase) {
            return testCase && testCase.test;
        }

        function test_validLogin() {
            var testCase = getTestCase("valid_login");
            if (!shouldRunTest(testCase)) {
                skip("===Prueba omitida: test_checkCheckbox===");
                return;
            }
            console.log("========================================");
            console.log("Hora de ejecución:", getCurrentTime());
            console.log("Ejecutando prueba: test_validLogin");
            console.log("========================================");
            wait(1000);
            mainProgram.txtUsername.text = testCase.username;
            wait(1000);
            mainProgram.txtPassword.text = testCase.password;
            wait(1000);
            mainProgram.boton.clicked();
            wait(1000);
            compare(mainProgram.lblMensaje.text, testCase.expectedMessage);
            compare(mainProgram.lblMensaje.color, testCase.expectedColor);
        }

        function test_invalidLogin() {
            var testCase = getTestCase("invalid_login");
            if (!shouldRunTest(testCase)) {
                skip("===Prueba omitida: test_checkCheckbox===");
                return;
            }
            console.log("========================================");
            console.log("Hora de ejecución:", getCurrentTime());
            console.log("Ejecutando prueba: test_invalidLogin");
            console.log("========================================");
            wait(1000);
            mainProgram.txtUsername.text = testCase.username;
            wait(1000);
            mainProgram.txtPassword.text = testCase.password;
            wait(1000);
            mainProgram.boton.clicked();
            wait(1000);
            compare(mainProgram.lblMensaje.text, testCase.expectedMessage);
            compare(mainProgram.lblMensaje.color, testCase.expectedColor);
        }

        function test_checkCheckbox() {
            var testCase = getTestCase("check_checkbox");
            if (!shouldRunTest(testCase)) {
                skip("===Prueba omitida: test_checkCheckbox===");
                return;
            }
            console.log("========================================");
            console.log("Hora de ejecución:", getCurrentTime());
            console.log("Ejecutando prueba: test_checkCheckbox");
            console.log("========================================");
            wait(1000);
            mainProgram.checkBoxCheck.checked = true
            wait(1000);
            compare(mainProgram.checkBoxChecked, testCase.checkbox);
        }

        function test_clickButton() {
            var testCase = getTestCase("click_button");
            if (!shouldRunTest(testCase)) {
                skip("===Prueba omitida: test_checkCheckbox===");
                return;
            }
            console.log("========================================");
            console.log("Hora de ejecución:", getCurrentTime());
            console.log("Ejecutando prueba: test_clickButton");
            console.log("========================================");
            wait(1000);
            mainProgram.botonColor.clicked()
            wait(1000);
            compare(mainProgram.backgroundColor, testCase.buttonColor);
        }
    }
}
