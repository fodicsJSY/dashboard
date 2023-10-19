
var cameraData1 = [
    {
        normal: '고승균',
        abnormal: '1'
    },
    {
        normal: '정재형',
        abnormal: '1'
    },
    {
        normal: '강인구',
        abnormal: '1'
    },
    {
        normal: '강인구',
        abnormal: '1'
    },
];

var liveCamera = null;

function createLiveCameraGrid()
{
    var elLiveCamera = document.getElementById('cameraGroup');
    //console.log('elLiveCamera : ' + elLiveCamera);

    if( liveCamera == null )
    {
        var usableScrollY = false;
        if( cameraData1.length > 6 )
            usableScrollY = true;

        liveCamera = new tui.Grid({
            el : elLiveCamera,
            data : cameraData1,
            scrollX: false,
            scrollY: usableScrollY,
            minRowHeight: 39,
            rowHeight: 39,
            bodyHeight: 234,
            minbodyHeight: 234,
            header: {
                height: '0px',					
            },
            columns: [
                {
                    header: '정상',
                    name: 'normal',
                },
                {
                    header: '비정상',
                    name: 'abnormal',
                },
            ],
        });

        
    }
};

