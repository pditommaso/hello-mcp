#!/usr/bin/env nextflow

/*
 * Nextflow Hello World example
 */

// Define parameters
params.greeting = 'Hello World!'
params.name = 'Nextflow'

// Print welcome message
println "Running Hello World pipeline"
println "Greeting: ${params.greeting}"
println "Name: ${params.name}"

// Define the workflow
workflow {
    // Create a channel with a simple message
    Channel.of("${params.greeting} from ${params.name}!")
        | sayHello
        | view
}

// Define the process
process sayHello {
    input:
    val message

    output:
    stdout

    script:
    """
    echo "${message}"
    echo "Current date: \$(date)"
    echo "Running on: \$(hostname)"
    """
}