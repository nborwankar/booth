

def with_db db
  if Booth[db]
    yield Booth[db]
  else
    je(404, "not_found", "No database: #{db}")
  end
end


put "/:db/?" do
  db = params[:db]
  if Booth[db]
    je(412, "db_exists", "The database already exists.")
  else
    Booth[db] = Database.new
    headers "Location" => "/#{CGI.escape(db)}"
    j(201, {"ok" => true})
  end
end

get "/:db/?" do
  with_db(params[:db]) do |db|
    j(200, {
      :db_name => params[:db],
      :doc_count => db.doc_count
    })    
  end
end

delete "/:db/?" do
  db = params[:db]
  if Booth[db]
    Booth.delete(db)
    j(200, {"ok" => true})
  else
    je(404, "not_found", "No database: #{db}")
  end
end

post "/:db/_bulk_docs" do
  with_db(params[:db]) do |db|
    docs = jbody
    
  end
end

post "/:db/_all_docs" do
  with_db(params[:db]) do |db|
    query = jbody
    unless query["keys"].is_a?(Array)
      raise BoothError.new(400, "bad_request", "`keys` member must be a array.");
    end
  end
end
