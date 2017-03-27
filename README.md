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
- Title: string
- Body: text
- Private: boolean (default: false)
- User: reference (index)

#### Associations to other models
- Belongs to: User

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
