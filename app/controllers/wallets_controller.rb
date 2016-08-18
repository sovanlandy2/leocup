require 'google/apis/options'
require 'google/api_client/auth/key_utils'
require 'signet/oauth_2/client'

class WalletsController < ApplicationController
	def index
		
		render layout: false
	end

	def getpass
		send_file Rails.public_path+ "amazongc.pkpass", type: 'application/vnd.apple.pkpass', disposition: 'attachment', filename: "amazongc.pkpass"
	end

	# def register_android_pay

	# 	client = Google::Apis::ClientOptions.new(
	# 	  :application_name => 'Android Pay App'
	# 	)
	# 	binding.pry
	# 	key = Google::APIClient::KeyUtils.load_from_pkcs12('/Users/sovanlan/Downloads/Amazon GC-2b220f31a1a4.p12', 'notasecret')
	# 	client.authorization = Signet::OAuth2::Client.new(
	# 	  :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
	# 	  :audience => 'https://accounts.google.com/o/oauth2/token',
	# 	  :scope => 'https://www.googleapis.com/auth/wallet_object.issuer',
	# 	  :issuer => '1021246142317-compute@developer.gserviceaccount.com',
	# 	  :signing_key => key)
	# 	## Request a token for our service account
	# 	client.authorization.fetch_access_token!


	# 	giftcard_class = generate_class('sovanlandy', 'DummyGCClass')
	# 	# Makes an API call to insert a new loyalty or offer class
	# 	result = client.execute(
	# 	  :api_method => walletobjects.giftcardclass.insert,
	# 	  :body_object => giftcard_class
	# 	)	
	# end
	
	# def generate_class(issuerId, classId)
	#   gift_card_class = {
	#     "kind" => "walletobjects#giftCardClass",
	#     "id" => "#{issuerId}.#{classId}",
	#     "issuerName" => "Sovanlandy",
	#     "merchantName" => "AddCash",
	#     "renderSpecs" => [{
	#       "templateFamily" => "1.giftCard1_list",
	#       "viewName" => "g_list"
	#     }, {
	#       "templateFamily" => "1.giftCard1_expanded",
	#       "viewName" => "g_expanded"
	#     }],
	#     "programLogo" => {
	#       "kind" => "walletobjects#image",
	#       "sourceUri" => {
	#         "kind" => "walletobjects#uri",
	#         "uri" => "http://farm8.staticflickr.com/7340/11177041185_a61a7f2139_o.jpg"
	#       }
	#     },
	#     "textModulesData" => [
	#       {
	#         "header" => "Where to Redeem",
	#         "body" => "All US gift cards are redeemable in any US and Puerto Rico" +
	#                   " Baconrista retail locations, or online at Baconrista.com where" +
	#                   " available, for merchandise or services."
	#       }
	#     ],
	#     "linksModuleData" => {
	#       "uris" => [
	#         {
	#           "kind" => "walletobjects#uri",
	#           "uri" => "http://www.baconrista.com/",
	#           "description" => "Baconrista"
	#         }
	#       ]
	#     },
	#     "locations" => [{
	#       "kind" => "walletobjects#latLongPoint",
	#       "latitude" => 37.422601,
	#       "longitude" => -122.085286
	#     }],
	#     "allowMultipleUsersPerObject" => true,
	#     "reviewStatus" => "underReview",
	#   }
	# end

	# def gift_card_object
	# 	{
	# 	  "kind" => "walletobjects#giftCardObject",
	# 	  "classId" => "1234567890.ExampleGCClass",
	# 	  "id" => "1234567890.ExampleGCObject",
	# 	  "cardNumber" => "123jkl4889",
	# 	  "pin" => "1111",
	# 	  "eventNumber" => "123456",
	# 	  "balance" => {
	# 	    "kind" => "walletobjects#money",
	# 	    "micros" => 20000000,
	# 	    "currencyCode" => "USD"
	# 	  },
	# 	  "balanceUpdateTime" => {
	# 	    "date" => Time.now.utc.strftime('%FT%H:%M:%S.%LZ')
	# 	  },
	# 	  "barcode" => {
	# 	    "alternateText" => "12345",
	# 	    "type" => "qrCode",
	# 	    "value" => "28343E3"
	# 	  },
	# 	  "textModulesData" => [{
	# 	    "header" => "Earn double points",
	# 	    "body" => "Jane, don't forget to use your Baconrista Rewards when " +
	# 	              "paying with this gift card to earn additional points"
	# 	  }],
	# 	  "linksModuleData" => {
	# 	    "uris" => [
	# 	      {
	# 	        "kind" => "walletobjects#uri",
	# 	        "uri" => "http://www.baconrista.com/mybalance?id=1234567890",
	# 	        "description" => "My Baconrista Gift Card Purchases"
	# 	      }]
	# 	  },
	# 	  "state" => "active",
	# 	  "version" => 1
	# 	}
	# end


	# def generate_jwt
	# 	jwt = {
	# 	   "iss"=> "1021246142317-compute@developer.gserviceaccount.com",
	# 	   "aud" => "google",
	# 	   "typ" => "savetowallet",
	# 	   "iat"=> Time.now.utc.to_i,
	# 	   "payload" => {
	# 	     "giftCardObjects" => [gift_card_object], #Loyalty objects
	# 	     "giftCardClasses" => ["sovanlandy.DummyGCClass"], #Loyalty classes
	# 	   },
	# 	   "origins"=> ['http://baconrista.com', 'https://baconrista.com']
	# 	}
	# 	private_key = Google::APIClient::PKCS12.load_key("/Users/sovanlan/Downloads/Amazon GC-2b220f31a1a4.p12", 'notasecret')
	# 	jwtEncoded = JWT.encode(jwt, private_key, "RS256")	
	# end
end
