class Api::V1::EntriesController < Api::V1::GraphitiController
  def index
    entries = EntryResource.all(params)
    respond_with(entries)
  end

  def show
    entry = EntryResource.find(params)
    respond_with(entry)
  end

  def create
    entry = EntryResource.build(params)

    if entry.save
      render jsonapi: entry, status: :created
    else
      render jsonapi_errors: entry
    end
  end

  def update
    entry = EntryResource.find(params)

    if entry.update_attributes
      render jsonapi: entry
    else
      render jsonapi_errors: entry
    end
  end

  def destroy
    entry = EntryResource.find(params)

    if entry.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: entry
    end
  end
end
