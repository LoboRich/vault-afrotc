import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-loading"

const application = Application.start()

// Automatically load all controllers from this directory
const context = require.context(".", true, /\.js$/)
application.load(definitionsFromContext(context))

export { application }
