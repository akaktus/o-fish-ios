import Danger
import DangerSwiftLint // package: https://github.com/ashfurrow/danger-swiftlint.git
import DangerXCodeSummary // package: https://github.com/f-meloni/danger-swift-xcodesummary.git


let danger = Danger()
SwiftLint.lint()

// Have different runs of SwiftLint against different sub-folders
SwiftLint.lint(directory: "Sources", configFile: ".swiftlint.yml")
SwiftLint.lint(directory: "Tests", configFile: "Tests/HarveyTests/.swiftlint.yml")

let summary = XCodeSummary(filePath: "result.json")
