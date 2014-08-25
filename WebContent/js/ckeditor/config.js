/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights
 *          reserved. For licensing, see LICENSE.html or
 *          http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
	config.toolbar = 'Define'; //自定义工具栏  ?

    config.toolbar_Define =

    [

       ['Source', '-', 'Preview', 'Print', 'Image'],

       ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],

       ['Bold', 'Italic', 'Underline', 'Strike'],

       ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],

       ['Link', 'Unlink', 'Anchor','NumberedList','BulletedList'],

       ['Styles', 'Format', 'Font', 'FontSize', 'TextColor', 'BGColor']

    ];
    config.toolbar_Definepb =

        [

           ['Source', '-', 'Preview', 'Print', 'Image','PageBreak'],

           ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord'],

           ['Bold', 'Italic', 'Underline', 'Strike'],

           ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],

           ['Link', 'Unlink', 'Anchor','NumberedList','BulletedList'],

           ['Styles', 'Format', 'Font', 'FontSize', 'TextColor', 'BGColor']

        ];
};
