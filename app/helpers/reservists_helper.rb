module ReservistsHelper
  def jsonb_rows(data, fields)
    return [] if data.blank?

    data = [data] if data.is_a?(Hash)
    data
  end
end
