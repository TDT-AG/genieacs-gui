class EncryptPasswords < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        users = User.all
        users.each do |user|
          raw_password = user.password_digest
          user.password = raw_password
          user.save!
        end
      end
      dir.down do
        raise ActiveRecord::IrreversibleMigration
      end
    end
  end
end
