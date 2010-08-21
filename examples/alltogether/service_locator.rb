require "rinda/ring"

class ServiceLocator
  def self.services
    @services ||= {}
  end
  
  def self.locate(service)
    return services[service] if services.has_key?(service)
    DRb.start_service 
    ring_server = Rinda::RingFinger.primary
    service = ring_server.read([service, nil, nil, nil])
    services[service] = service[2]
  end
end