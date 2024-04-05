# frozen_string_literal: true

Capybara.server = :puma, { Silent: true }
Capybara.javascript_driver = :selenium_headless
