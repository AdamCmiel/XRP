Account = require "../../src/models/Account"
{expect, assert, should, use} = require "chai"
should()
Backbone = require "backbone"
XRP = require "xrp-app-lib"

key = "rfemvFrpCAPc4hUa1v8mPRYdmaCqR1iFpe"

describe "Account Model", ->

    account = new Account account: XRP.importAccountFromAddress key

    it "should be a Backbone Model", ->
        account.should.be.an.instanceof Account
        account.should.be.an.instanceof Backbone.Model

    it "should get its public key from the constructor", ->
        account.get "account"
               .publicKey.should.equal key

    it "should check the balance of the model", ->
        account.updateBalance()
               .then (account) ->
                   account.get "account"
                          .balance.should.exist.and.be.above 0

    it "should respond to change events", ->
        spy = ->
            assert true
            assert account
               .is @

        account.on "change:balance", spy, account
        _acc = account.get "account"
        _acc.balance = 100
        account.set "account", _acc

