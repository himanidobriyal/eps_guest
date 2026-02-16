// -------------------------------
// Load saved language
// -------------------------------
const savedLanguage = localStorage.getItem("bhashini_language") || "en";

// -------------------------------
// When user changes language, save it
// -------------------------------
document.addEventListener("bhashiniLanguageChanged", (e) => {
    const lang = e.detail.language;
    localStorage.setItem("bhashini_language", lang);
});

// -------------------------------
// Initialize Bhashini Plugin when script loads
// (Will add correct init after you share next manual page)
// -------------------------------
window.addEventListener("load", () => {
    if (window.bhashiniPluginInit) {

        window.bhashiniPluginInit({
            defaultLanguage: savedLanguage,
            languageIconColor: "#ffffff"
        });

    } else {
        console.warn("Bhashini plugin not loaded yet.");
    }
});
