require 'json'
require 'faker'
require 'aws-sdk'

Aws.config.update({
   credentials: Aws::Credentials.new(
     ENV['access_key_id'],
     ENV['secret_access_key']
   )
})

def hello(event:, context:)

  f_name = Faker::Name.first_name
  l_name = Faker::Name.last_name

  dynamodb = Aws::DynamoDB::Client.new(region: 'us-east-1')

  item = {
    firstName: f_name,
    lastName: l_name,
    derp: {
    }
  }

  params = {
      table_name: 'myService',
      item: item
  }

  begin
    dynamodb.put_item(params)
    puts 'Added to table'
  rescue  Aws::DynamoDB::Errors::ServiceError => error
    puts 'Unable to add to table'
    puts error.message
  end

  {
    statusCode: 200,
    body: JSON.generate('Go Serverless v1.0! Your function executed successfully!'),

  }
end
