require 'google/api_client/auth/key_utils'
require 'signet/oauth_2/client'
require 'rest-client'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE



class WalletsController < ApplicationController
	def index
		register_android_pay
		@jwt = jwt
		render layout: false
	end

	def gc_object
{
  "kind": "walletobjects#giftCardObject",
  "id": "3159934451820935496.AddCash.123",
  "classId": "3159934451820935496.GiftcardAddCash",
  "version": "1",
  "state": "active",
  "issuerData": {
    "kind": "walletobjects#typedValue"
  },
  "barcode": {
    "kind": "walletobjects#barcode",
    "type": "code128",
    "value": "28343E3",
    "alternateText": "12345"
  },
  "textModulesData": [
    {
      "header": "Earn double points",
      "body": "Landy, don't forget to top up your Amazon gift card to earn additional points for shopping on Amazon.com"
    }
  ],
  "linksModuleData": {
    "uris": [
      {
        "kind": "walletobjects#uri",
        "uri": "http://www.amazon.com",
        "description": "AddCash"
      }
    ]
  },
  "classReference": {
    "kind": "walletobjects#giftCardClass",
    "id": "3159934451820935496.GiftcardAddCash",
    "version": "0",
    "issuerName": "Amazon Inc",
    "issuerData": {
      "kind": "walletobjects#typedValue"
    },
    "renderSpecs": [
      {
        "viewName": "g_here_and_now",
        "templateFamily": "1.giftCard1_list"
      },
      {
        "viewName": "g_list",
        "templateFamily": "1.giftCard1_list"
      },
      {
        "viewName": "g_my_wallet_tile",
        "templateFamily": "1.giftCard1_list"
      },
      {
        "viewName": "g_expanded",
        "templateFamily": "1.giftCard1_expanded"
      }
    ],
    "allowMultipleUsersPerObject": true,
    "locations": [
      {
        "kind": "walletobjects#latLongPoint",
        "latitude": 37.422601,
        "longitude": -122.085286
      }
    ],
    "reviewStatus": "approved",
    "textModulesData": [
      {
        "header": "Message1",
        "body": "All US gift cards are redeemable in any US at any Amazon retail partner locations"
      }
    ],
    "linksModuleData": {
      "uris": [
        {
          "kind": "walletobjects#uri",
          "uri": "tel://18882332274",
          "description": "1-888-ADD-CASH"
        },
        {
          "kind": "walletobjects#uri",
          "uri": "http://www.amazon.com",
          "description": "View your balance"
        },
        {
          "kind": "walletobjects#uri",
          "uri": "http://www.amazon.com",
          "description": "Nearby Location"
        }
      ]
    },
    "merchantName": "Amazon Inc",
    "programLogo": {
      "kind": "walletobjects#image",
      "sourceUri": {
        "kind": "walletobjects#uri",
        "uri": "https://s3-ap-southeast-1.amazonaws.com/landy-public/add_cash_logo.png"
      }
    }
  },
  "cardNumber": "3159934451820935496.AddCash.123",
  "balance": {
    "kind": "walletobjects#money",
    "micros": "1000000000",
    "currencyCode": "USD"
  },
  "balanceUpdateTime": {
    "date": "2016-08-22T21:31:35.355Z"
  }
}
	end

	def gc_class
		{
    "kind" => "walletobjects#giftCardClass",
    "id" => "3159934451820935496.GiftcardTest",
    "issuerName" => "Baconrista Landy",
    "merchantName" => "Baconrista Landy",
    "renderSpecs" => [{
      "templateFamily" => "1.giftCard1_list",
      "viewName" => "g_list"
    }, {
      "templateFamily" => "1.giftCard1_expanded",
      "viewName" => "g_expanded"
    }],
    "programLogo" => {
      "kind" => "walletobjects#image",
      "sourceUri" => {
        "kind" => "walletobjects#uri",
        "uri" => "http=>//farm8.staticflickr.com/7340/11177041185_a61a7f2139_o.jpg"
      }
    },
    "textModulesData" => [
      {
        "header" => "Where to Redeem",
        "body" => "All US gift cards are redeemable in any US and Puerto Rico Baconrista retail locations, or online at Baconrista.com where available, for merchandise or services."
      }
    ],
    "linksModuleData" => {
      "uris" => [
        {
          "kind" => "walletobjects#uri",
          "uri" => "http=>//www.baconrista.com/",
          "description" => "Baconrista"
        }
      ]
    },
    "locations" => [{
      "kind" => "walletobjects#latLongPoint",
      "latitude" => 37.422601,
      "longitude" => -122.085286
    }],
    "allowMultipleUsersPerObject" => true,
    "reviewStatus" => "underReview"
  }
		
	end

	def jwt
		a = {
		   "iss"=> '901839982269-compute@developer.gserviceaccount.com',
		   "aud" => "google",
		   "typ" => "savetowallet",
		   "iat"=> Time.now.utc.to_i,
		   "payload" => {
		     "giftCardObjects" => [gc_object]
		   },
		   "origins"=> ['http://192.168.0.199:3000']
		}
		private_key = Google::APIClient::KeyUtils.load_from_pkcs12('/Users/sovanlan/Downloads/WalletGC-1b9fd68f24c5.p12', 'notasecret')
		jwtEncoded = JWT.encode(a, private_key, "RS256")
	end

	def getpass
		send_file Rails.public_path+ "amazongc.pkpass", type: 'application/vnd.apple.pkpass', disposition: 'attachment', filename: "amazongc.pkpass"
	end

	def register_android_pay
		key = Google::APIClient::KeyUtils.load_from_pkcs12('/Users/sovanlan/Downloads/WalletGC-1b9fd68f24c5.p12', 'notasecret')
		auth = Signet::OAuth2::Client.new(
		  :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
		  :audience => 'https://accounts.google.com/o/oauth2/token',
		  :scope => 'https://www.googleapis.com/auth/wallet_object.issuer',
		  :issuer => '901839982269-compute@developer.gserviceaccount.com',
		  :signing_key => key)
		## Request a token for our service account
		
		token = auth.fetch_access_token!
		access_token = token["access_token"]
		

		giftcard_class = generate_class('sovanlandy', 'DummyGCClass')
		# Makes an API call to insert a new loyalty or offer class
		
		#binding.pry
		#data = RestClient.post 'https://www.googleapis.com/walletobjects/v1/giftCardClass', giftcard_class.to_json , {:Authorization => 'Bearer #{access_token}', :content_type => :json, :accept => :json}
		#data = JSON.parse(data);
		
		
	end
	
	def generate_class(issuerId, classId)
	  gift_card_class = {
	    "kind" => "walletobjects#giftCardClass",
	    "id" => "#{issuerId}.#{classId}",
	    "issuerName" => "Sovanlandy",
	    "merchantName" => "AddCash",
	    "renderSpecs" => [{
	      "templateFamily" => "1.giftCard1_list",
	      "viewName" => "g_list"
	    }, {
	      "templateFamily" => "1.giftCard1_expanded",
	      "viewName" => "g_expanded"
	    }],
	    "programLogo" => {
	      "kind" => "walletobjects#image",
	      "sourceUri" => {
	        "kind" => "walletobjects#uri",
	        "uri" => "http://farm8.staticflickr.com/7340/11177041185_a61a7f2139_o.jpg"
	      }
	    },
	    "textModulesData" => [
	      {
	        "header" => "Where to Redeem",
	        "body" => "All US gift cards are redeemable in any US and Puerto Rico" +
	                  " Baconrista retail locations, or online at Baconrista.com where" +
	                  " available, for merchandise or services."
	      }
	    ],
	    "linksModuleData" => {
	      "uris" => [
	        {
	          "kind" => "walletobjects#uri",
	          "uri" => "http://www.baconrista.com/",
	          "description" => "Baconrista"
	        }
	      ]
	    },
	    "locations" => [{
	      "kind" => "walletobjects#latLongPoint",
	      "latitude" => 37.422601,
	      "longitude" => -122.085286
	    }],
	    "allowMultipleUsersPerObject" => true,
	    "reviewStatus" => "underReview",
	  }
	end

	def gift_card_object
		{
		  "kind" => "walletobjects#giftCardObject",
		  "classId" => "1234567890.ExampleGCClass",
		  "id" => "1234567890.ExampleGCObject",
		  "cardNumber" => "123jkl4889",
		  "pin" => "1111",
		  "eventNumber" => "123456",
		  "balance" => {
		    "kind" => "walletobjects#money",
		    "micros" => 20000000,
		    "currencyCode" => "USD"
		  },
		  "balanceUpdateTime" => {
		    "date" => Time.now.utc.strftime('%FT%H:%M:%S.%LZ')
		  },
		  "barcode" => {
		    "alternateText" => "12345",
		    "type" => "qrCode",
		    "value" => "28343E3"
		  },
		  "textModulesData" => [{
		    "header" => "Earn double points",
		    "body" => "Jane, don't forget to use your Baconrista Rewards when " +
		              "paying with this gift card to earn additional points"
		  }],
		  "linksModuleData" => {
		    "uris" => [
		      {
		        "kind" => "walletobjects#uri",
		        "uri" => "http://www.baconrista.com/mybalance?id=1234567890",
		        "description" => "My Baconrista Gift Card Purchases"
		      }]
		  },
		  "state" => "active",
		  "version" => 1
		}
	end


	def generate_jwt
		jwt = {
		   "iss"=> "1021246142317-compute@developer.gserviceaccount.com",
		   "aud" => "google",
		   "typ" => "savetowallet",
		   "iat"=> Time.now.utc.to_i,
		   "payload" => {
		     "giftCardObjects" => [gift_card_object], #Loyalty objects
		     "giftCardClasses" => ["sovanlandy.DummyGCClass"], #Loyalty classes
		   },
		   "origins"=> ['http://baconrista.com', 'https://baconrista.com']
		}
		private_key = Google::APIClient::PKCS12.load_key("/Users/sovanlan/Downloads/Amazon GC-2b220f31a1a4.p12", 'notasecret')
		jwtEncoded = JWT.encode(jwt, private_key, "RS256")	
	end
end
