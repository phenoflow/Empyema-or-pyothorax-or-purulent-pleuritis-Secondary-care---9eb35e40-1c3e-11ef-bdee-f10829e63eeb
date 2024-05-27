cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  empyema-or-pyothorax-or-purulent-pleuritis-secondary-care-fistula---secondary:
    run: empyema-or-pyothorax-or-purulent-pleuritis-secondary-care-fistula---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  empyema---secondary:
    run: empyema---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: empyema-or-pyothorax-or-purulent-pleuritis-secondary-care-fistula---secondary/output
  empyema-or-pyothorax-or-purulent-pleuritis-secondary-care-confirmation---secondary:
    run: empyema-or-pyothorax-or-purulent-pleuritis-secondary-care-confirmation---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: empyema---secondary/output
  empyema-or-pyothorax-or-purulent-pleuritis-secondary-care-confirmed---secondary:
    run: empyema-or-pyothorax-or-purulent-pleuritis-secondary-care-confirmed---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: empyema-or-pyothorax-or-purulent-pleuritis-secondary-care-confirmation---secondary/output
  pyothorax---secondary:
    run: pyothorax---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: empyema-or-pyothorax-or-purulent-pleuritis-secondary-care-confirmed---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: pyothorax---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
