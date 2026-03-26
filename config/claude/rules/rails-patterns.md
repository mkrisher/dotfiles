---
paths:
  - "**/*.rb"
  - "app/"
  - "spec/"
---

# Rails conventions
- Service objects in app/services/ (PORO)
- No business logic in views
- Prefer business logic in models, but if it grows too large, extract to service objects
- Never update_column — skips validations
- Only use ActiveRecord callbacks for data integrity, not side effects

# Testing
- RSpec + FactoryBot, prefer build_stubbed
