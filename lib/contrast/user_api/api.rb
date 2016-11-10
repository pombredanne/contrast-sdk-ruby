module Contrast
  module UserApi
    class API
      extend Forwardable

      def_delegators :@application_api,
          :applications_name,
          :applications,
          :application,
          :applications_allowed,
          :applications_simplified,
          :applications_filters,
          :applications_filters_quick,
          :applications_subfilters,
          :update_application_importance,
          :application_license,
          :application_component,
          :application_coverage,
          :application_coverage_weekly_stats,
          :application_history,
          :application_history_by_interval,
          :application_history_by_interval_with_defense,
          :application_libraries,
          :application_libraries_filter,
          :application_libraries_filter_by_type,
          :application_libraries_stats,
          :application_status_breakdown,
          :application_servers,
          :application_servers_breakdown,
          :application_servers_count,
          :application_newest_server,
          :application_servers_properties,
          :application_servers_settings,
          :application_servers_settings_by_environment,
          :application_technologies,
          :application_trace_breakdown,
          :application_trace_rule_breakdown,
          :application_trace_severity_breakdown,
          :application_trace_status_breakdown,
          :application_traces_filter,
          :application_traces_subfilter,
          :application_traces_subfilter_keycode_search,
          :application_traces_subfilter_keycode_search_simplified,
          :application_traces_subfilter_keycode_severities,
          :application_traces_subfilter_keycode_status,
          :application_filter_trace,
          :delete_application_traces,
          :delete_application_trace,
          :export_application_traces_csv,
          :export_application_traces_csv_all,
          :export_application_traces_xml,
          :export_application_traces_xml_all,
          :application_trace_uuids,
          :application_traces_with_policy_violations,
          :application_traces_quick_filters,
          :application_trace_requirements,
          :application_trace_servers,
          :application_trace_url_instances,
          :export_application_traces_subfilter_keycode_csv,
          :export_application_traces_subfilter_keycode_xml,
          :application_trace_simplified,
          :application_trace_visibility

      attr_reader :host,
          :org_uuid,
          :api_key, 
          :authorization_base64

      def initialize config = nil
        if config.nil?
          # TODO: look in common places for configuration YAML
        elsif config.is_a?(String)
          # TODO: use the string as a file path to load the configuration YAML
        elsif config.is_a?(Hash)
          # TODO: load configuration items from the given hash
        end

        @host = 'http://localhost:19080/Contrast/'
        @org_uuid = '9c1dd905-e8d5-447b-b1be-00cbda0d0e67'
        @api_key = 'demo'
        @authorization_base64 = 'Y29udHJhc3RfYWRtaW46ZGVtbw=='

        @activity_api = with_defaults(ActivityApi)
        @application_api = with_defaults(ApplicationApi)
        @libraries_api = with_defaults(LibrariesApi)
        @events_api = with_defaults(EventsApi)
        @history_api = with_defaults(HistoryApi)
      end

      def with_defaults clazz
p clazz
        inst = clazz.new('api/ng')
        inst.org_uuid = org_uuid
        inst.class.base_uri(base_uri)
        inst.class.headers(headers)
        inst
      end

      def base_uri
        host
      end

      def headers
        {
          "API-Key" => api_key,
          "Authorization" => authorization_base64
        }
      end
    end
  end
end