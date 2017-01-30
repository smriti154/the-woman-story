class AddAttachmentPhotoToDomains < ActiveRecord::Migration
  def self.up
    change_table :domains do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :domains, :photo
  end
end
