import { denieLocation } from './DenieGeolocation.js'

export { getLocation }

async function getLocation() {
    let lat = 25.034488;
    let lon = 121.543530;
    return await new Promise((resolve, reject) => {
        navigator.geolocation.getCurrentPosition((position) => {
            // let lat = position.coords.latitude;
            // let lon = position.coords.longitude;

            // console.log(lat, lon) 25.034488, 121.543530
            sessionStorage.setItem("lat", lat)
            sessionStorage.setItem("lon", lon)
            // document.cookie = `lat=${lat}`
            // document.cookie = `lon=${lon}`

            resolve(true);
        }, (error) => {
            let lat = 25.034488;
            let lon = 121.543530;
            sessionStorage.setItem("lat", lat)
            sessionStorage.setItem("lon", lon)
            // denieLocation();
            // reject(false);
        });
    })
}

