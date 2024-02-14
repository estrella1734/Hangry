
export function getCookieData(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) {
        const encodedString = parts.pop().split(';').shift();
        try {
            const decodedString = atob(encodedString);
            const jsonCookie = JSON.parse(decodedString);
            return jsonCookie;
        } catch (error) {
            console.error('Error decoding or parsing Cookie', error);
        }
    }
    return null;
}