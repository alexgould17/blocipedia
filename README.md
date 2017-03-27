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
All test accounts have the email test.[role]X@blocipedia.test where [role] is the role the test account holds (admin, premium or standard) & X is the # account they are of that particular account level. The password on all test accounts is 123456. There are 3 standard users, 2 premium users & 1 admin user seeded to the db for testing purposes, all confirmed. NOTE: the admin test account has no number in the email address or user name.
