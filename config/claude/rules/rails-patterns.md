---
paths:
  - "**/*.rb"
  - "app/"
  - "spec/"
---

# Rails conventions
- Service objects in app/services/ (PORO)
- No business logic in controllers or views
- No after_commit for side effects — use jobs
- Never update_column — skips validations
- Only use ActiveRecord callbacks for data integrity, not side effects

# Testing
- RSpec + FactoryBot, prefer build_stubbed
