module OpenFlashChartMultiple
  def js_open_flash_chart_object_multi(div_name, width, height, base="/")
    <<-OUTPUT
      <script type="text/javascript">
        swfobject.embedSWF("#{base}open-flash-chart.swf", "#{div_name}", "#{width}", "#{height}", "9.0.0", "expressInstall.swf", {"get-data":"ofc_get_data_#{div_name}"});
      </script>
      <div id="#{div_name}"></div>
      <script>
        function ofc_ready() {}
        function ofc_get_data_#{div_name}()
        {
           return Object.toJSON(#{self.render});
        }
      </script>
    OUTPUT
  end
end

OpenFlashChart::Base.send(:include,OpenFlashChartMultiple)