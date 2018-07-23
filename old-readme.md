# README

Blocipedia rundown

## Project basics
### Ruby version
2.3.3

### Top-level paths
- /about: Definition of Blocipedia.
- /faq: Answers to frequently asked questions.
- /contact: How to get in touch with Blocipedia's owner.

## Models

### Wiki
#### Attributes
- title: string
- body: text
- private: boolean (default: false)
- user: reference (index)

#### Associations to other models
- Belongs to: User

### User
#### Attributes
- name: string
- email: string (unique, lowercased before save)
- role: enumerated integer {0: standard, 1: premium, 2: admin}
- id: integer (unique, auto)
- created_at: timestamp (auto)
- updated_at: timestamp (auto)

## Controllers

### Wiki
#### Actions
- new
- create
- index
- show
- edit
- update
- delete

## Testing Info
### Pre-seeded Accounts
All test accounts have randomly-generated names & emails now *except* the admin account, which is still test.admin@blocipedia.test. All test passwords are still wsxedc. DB is now seeded with test wikis too.
