<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="{{ asset('/adminAssets/plugins/jquery/jquery.min.js') }}"></script>
<!-- Bootstrap -->
<script src="{{ asset('/adminAssets/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<!-- overlayScrollbars -->
<script src="{{ asset('/adminAssets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('/adminAssets/dist/js/adminlte.js') }}"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="{{ asset('/adminAssets/plugins/jquery-mousewheel/jquery.mousewheel.js') }}"></script>
<script src="{{ asset('/adminAssets/plugins/raphael/raphael.min.js') }}"></script>
<script src="{{ asset('/adminAssets/plugins/jquery-mapael/jquery.mapael.min.js') }}"></script>
<script src="{{ asset('/adminAssets/plugins/jquery-mapael/maps/usa_states.min.js') }}"></script>
<!-- ChartJS -->
<script src="{{ asset('adminAssets/plugins/chart.js/Chart.min.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="{{ asset('adminAssets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/jszip/jszip.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/pdfmake/pdfmake.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/pdfmake/vfs_fonts.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
<script src="{{ asset('adminAssets/plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>
<script src="{{ asset('adminAssets/custom.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="module">
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
</script>
<!-- Summernote -->
<script src="{{ asset('adminAssets/plugins/summernote/summernote-bs4.min.js') }}"></script>

@yield('scripts')
