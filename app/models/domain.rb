class Domain < ActiveRecord::Base
  after_create :add_tenant_to_apartment
  has_attached_file :photo 

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
 
  def self.current
    tenant = Tenant.find_by name:Apartment::Tenant.current
    raise ::Apartment::TenantNotFound, "Unable to find tenant" unless tenant
    tenant
  end
 
  def switch!
    Apartment::Tenant.switch! name
  end
 
  private
    def add_tenant_to_apartment
      Apartment::Tenant.create(name)
    end
 
    def drop_tenant_from_apartment
      Apartment::Tenant.drop(name)
    end
end
