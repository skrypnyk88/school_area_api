FactoryGirl.define do
  factory :potty do
    time '12:20'
    potty_type { %w(wet_diaper bm_diaper wet_potty bm_potty dry).sample }
  end
end
