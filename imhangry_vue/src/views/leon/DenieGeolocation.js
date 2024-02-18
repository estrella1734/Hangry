import Swal from 'sweetalert2'
export { denieLocation }


function denieLocation() {
    sessionStorage.removeItem("lat")
    sessionStorage.removeItem("lon")
    Swal.fire({
        title: "提醒",
        text: "無法確定你的位置，請開啟定位功能以搜尋附近店家！",
    })
}