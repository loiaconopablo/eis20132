Feature: Enviar Consulta

  Scenario: Happy
    Given there is a "Programmer vacancy" offer
    When I click "Question"
    And write my  question
    Then I should see "Consulta Enviada"
