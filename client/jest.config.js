/** @type {import('ts-jest').JestConfigWithTsJest} */

module.exports = {
    setupFiles: ["<rootDir>/tests/unit/index.js"],
    moduleFileExtensions: ["js", "json", "vue"],
    transform: {
        "^.+\\.vue$": "@vue/vue3-jest",
        '^.+\\.js$': 'babel-jest',
        '^.+\\.mjs$': 'babel-jest'
    },
    transformIgnorePatterns: [
        '/node_modules/(?!vuetify).+\\.js$'
    ],
    preset: 'ts-jest',
    testEnvironment: 'jsdom',
    testEnvironmentOptions: {
        customExportConditions: ["node", "node-addons"],
    },
    moduleNameMapper: {
        '^vuetify$': '<rootDir>/node_modules/vuetify/dist/vuetify.js'
    }
}

