class AddAccessTokenSecretToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :accesstokensecret, :string
  end
end
