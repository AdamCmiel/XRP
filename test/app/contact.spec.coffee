Contact = require "../../src/models/Contact"
Account = require "../../src/models/Account"
{expect, assert, should, use} = require "chai"
should()
Backbone = require "backbone"

key = "rfemvFrpCAPc4hUa1v8mPRYdmaCqR1iFpe"

describe "Contact Model", ->

    account = new Account
        account:
            publicKey: key
            balance: 0

    alice = new Contact
        name: "Alice Roberts"
        email: "alice@foo.bar"
        account: account

    it "should be a Backbone Model", ->
        alice.should.be.an.instanceof Contact
        alice.should.be.an.instanceof Backbone.Model

    # Refactor to use new account class from XRP Lib
    it "should query a contact for its account", ->
        alice.get "account"
             .get "account"
             .publicKey.should.equal key

