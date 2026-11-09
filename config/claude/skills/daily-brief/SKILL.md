---
name: daily-brief
description: Assemble and post a morning daily brief combining Oura sleep data and today's Fantastical calendar into Notion. Use this skill whenever the user asks for their "daily brief", "morning brief", "morning summary", "what's on today", or any combination of sleep data + today's schedule. Also trigger when the user asks to update or post their Daily Note with health or calendar data.
---

# Daily Brief Skill

Assembles a structured morning brief from two data sources — Oura sleep metrics and Fantastical calendar — and prepends it to today's Daily Note in Notion.

---

## Step 1: Read Oura Data

Use the Oura MCP tools to fetch today's data:

- Call `mcp__Oura__get_daily_sleep` with `start_date: "today"` → extract `score` (sleep score)
- Call `mcp__Oura__get_sleep_periods` with `start_date: "today"` → extract `average_hrv` (ms) and `lowest_heart_rate` (bpm)

**If any tool call fails or returns null:** note "Oura data unavailable" for that metric and continue. Do not abort the brief.

---

## Step 2: Fetch Today's Calendar

Use the `mcp__Fantastical__queryCalendarItems` tool to fetch today's events.

- Scope: **today only**
- Include: event title, start time, end time
- Format each event as: `HH:MM AM/PM – HH:MM AM/PM — Event Title`
- Sort chronologically
- If no events found, note "No meetings scheduled today"

---

## Step 3: Assemble the Brief

Compose the brief in this exact format:

```
**Daily Brief — [Today's Date, e.g. "March 27, 2026"]**

**Health Snapshot**
- Sleep Score: [value or "unavailable"]
- Average HRV: [value] ms (or "unavailable")
- Lowest Heart Rate: [value] bpm (or "unavailable")

**Today's Schedule**
[each event on its own line: HH:MM AM/PM – HH:MM AM/PM — Event Title]

---
```

---

## Step 4: Prepend to Notion Daily Note

### 4a. Find today's Daily Note

Use `Notion:notion-search` to search for today's Daily Note:
- Query: today's date as a string, e.g. `"Daily Note March 27 2026"`
- Filter by today's date
- Target database collection ID: `collection://1d1d4831-26cd-80e1-bba7-000badc35273`
- Look for a page whose `Date` property matches today

### 4b. Prepend the brief

Use `Notion:notion-update-page` to prepend the assembled brief at the **very top** of the page content — above any existing content.

### 4c. If no Daily Note found

Note it in the output. **Do not create a new page.** Skip the Notion step and still show the brief in chat.

---

## Output

Always display the completed brief in chat regardless of whether the Notion update succeeded. If the Notion update succeeded, confirm it. If it failed or no Daily Note was found, say so clearly.
