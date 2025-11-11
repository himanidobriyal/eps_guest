(function () {
	// Load Font Awesome dynamically
	const fa = document.createElement("link");
	fa.rel = "stylesheet";
	fa.href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css?v=" + Date.now();
	document.head.appendChild(fa);

  const storageKey = "accessibilityPrefs";

  const features = {
    highContrast: "default",
    highlightLinks: false,
    biggerText: "default",
    textSpacing: false,
    pauseAnimations: false,
    hideImages: false,
    dyslexiaFriendly: false,
    largeCursor: false,
    showTooltips: false,
    textToSpeech: false,
    lineHeight: "default",
    textAlign: "default",
    saturation: "default",
  };

  function applySavedPreferences() {
    for (const [key, val] of Object.entries(features)) {
      if (typeof val === "boolean" && val) {
        const cls = featureToClass(key);
        if (cls) document.body.classList.add(cls);
        if (key === "textToSpeech") handleTextToSpeech(true, true);
      } else if (val !== "default") {
        const prefix = {
          highContrast: "high-contrast-",
          biggerText: "bigger-text-",
          lineHeight: "line-height-",
          textAlign: "text-align-",
          saturation: "saturation-",
        }[key];
        if (prefix) document.body.classList.add(prefix + val);
      }
    }
  }


  document.addEventListener("DOMContentLoaded", () => {
    // ✅ Step 1: Ensure #page-content wrapper exists first
    if (!document.querySelector("#page-content")) {
      const wrapper = document.createElement("div");
      wrapper.id = "page-content";
      while (document.body.firstChild) {
        wrapper.appendChild(document.body.firstChild);
      }
      document.body.appendChild(wrapper);
    }

    // ✅ Step 2: Load and apply preferences BEFORE widget is initialized
    const savedPrefs = localStorage.getItem(storageKey);
    if (savedPrefs) {
      Object.assign(features, JSON.parse(savedPrefs));
      applySavedPreferences();
    }

    // ✅ Step 3: Now initialize the widget (adds ♿ button + panel)
    initializeWidget();
  });

  // === Widget Initialization ===
  function initializeWidget() {
    const widgetHTML = `
	<button class="accessibility-toggle-btn" id="accToggleBtn" title="Accessibility Tools">
	    <i class="fa-solid fa-universal-access"></i>
	</button>

      <div class="accessibility-widget" id="accWidget">
        <h4 id="widgetHeader">Accessibility Menu</h4>
        <div class="widget-content">
          <div class="accessibility-grid">
            <button class="btn-high-contrast" id="btn-highContrast" onclick="toggleFeature('highContrast')">
              <span class="btn-icon">◐</span><span class="btn-label">Contrast</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-highlight-links" id="btn-highlightLinks" onclick="toggleFeature('highlightLinks')">
              <span class="btn-icon">🔗</span><span class="btn-label">Highlight Links</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-bigger-text" id="btn-biggerText" onclick="toggleFeature('biggerText')">
              <span class="btn-icon">TT</span><span class="btn-label">Bigger Text</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-text-spacing" id="btn-textSpacing" onclick="toggleFeature('textSpacing')">
              <span class="btn-icon">← - →</span><span class="btn-label">Text Spacing</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-pause-animations" id="btn-pauseAnimations" onclick="toggleFeature('pauseAnimations')">
              <span class="btn-icon">⦿</span><span class="btn-label">Pause Animations</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-hide-images" id="btn-hideImages" onclick="toggleFeature('hideImages')">
              <span class="btn-icon">🖼</span><span class="btn-label">Hide Images</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-dyslexia-friendly" id="btn-dyslexiaFriendly" onclick="toggleFeature('dyslexiaFriendly')">
              <span class="btn-icon">Aa</span><span class="btn-label">Dyslexia Friendly</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-large-cursor" id="btn-largeCursor" onclick="toggleFeature('largeCursor')">
              <span class="btn-icon">↖</span><span class="btn-label">Large Cursor</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-show-tooltips" id="btn-showTooltips" onclick="toggleFeature('showTooltips')">
              <span class="btn-icon">💬</span><span class="btn-label">Show Tooltips</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-text-to-speech" id="btn-textToSpeech" onclick="toggleFeature('textToSpeech')">
              <span class="btn-icon">🔊</span><span class="btn-label">Text to Speech</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-line-height" id="btn-lineHeight" onclick="toggleFeature('lineHeight')">
              <span class="btn-icon">↕</span><span class="btn-label">Line Height</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-text-align" id="btn-textAlign" onclick="toggleFeature('textAlign')">
              <span class="btn-icon">≡</span><span class="btn-label">Text Align</span><span class="btn-status">OFF</span>
            </button>
            <button class="btn-saturation" id="btn-saturation" onclick="toggleFeature('saturation')">
              <span class="btn-icon">🎨</span><span class="btn-label">Saturation</span><span class="btn-status">OFF</span>
            </button>
          </div>
          <button class="reset-btn" onclick="resetAll()">Reset All Settings</button>
        </div>
      </div>`;
    document.body.insertAdjacentHTML("beforeend", widgetHTML);

    const toggleBtn = document.getElementById("accToggleBtn");
    const widget = document.getElementById("accWidget");
    const widgetHeader = document.getElementById("widgetHeader");

    toggleBtn.addEventListener("click", (e) => {
      e.stopPropagation();
      document.getElementById("accWidget").classList.toggle("active");

    });

    widgetHeader.addEventListener("click", (e) => {
      const rect = widgetHeader.getBoundingClientRect();
      const clickX = e.clientX - rect.left;
      if (clickX > rect.width - 60) widget.classList.remove("active");
    });

    document.addEventListener("click", (e) => {
      if (!e.target.closest(".accessibility-widget") && !e.target.closest(".accessibility-toggle-btn"))
        widget.classList.remove("active");
    });

    widget.addEventListener("click", (e) => e.stopPropagation());
	  document.addEventListener("keydown", (e) => {
	    if (e.ctrlKey && e.key === "u") {
	      e.preventDefault();
	      widget.classList.toggle("active");
	    }
	  });

	  // ✅ Now that the buttons exist, sync their visual states
	  setTimeout(loadPrefs, 100);
	}


  // === FEATURE TOGGLE HANDLER ===
  window.toggleFeature = function (feature) {
    if (feature === "highContrast") return cycleFeature("highContrast", ["default", "inverted", "dark", "light"], "high-contrast-");
    if (feature === "biggerText") return cycleFeature("biggerText", ["default", "light", "medium", "heavy"], "bigger-text-");
    if (feature === "lineHeight") return cycleFeature("lineHeight", ["default", "1_5", "2_0", "2_5"], "line-height-");
    if (feature === "textAlign") return cycleFeature("textAlign", ["default", "left", "center", "right", "justify"], "text-align-");
    if (feature === "saturation") return cycleFeature("saturation", ["default", "low", "medium", "high"], "saturation-");

    features[feature] = !features[feature];
    const className = featureToClass(feature);
    if (className) document.body.classList.toggle(className);
    if (feature === "textToSpeech") handleTextToSpeech(features[feature], true);

    const btn = document.getElementById("btn-" + feature);
    if (btn) {
      btn.classList.toggle("active", features[feature]);
      const status = btn.querySelector(".btn-status");
      if (status) status.textContent = features[feature] ? "ON" : "OFF";
    }
    savePrefs();
  };

  function cycleFeature(name, options, classPrefix) {
    const currentIndex = options.indexOf(features[name]);
    const nextIndex = (currentIndex + 1) % options.length;
    features[name] = options[nextIndex];

    document.body.classList.forEach((cls) => {
      if (cls.startsWith(classPrefix)) document.body.classList.remove(cls);
    });
    if (features[name] !== "default")
      document.body.classList.add(classPrefix + features[name]);

    updateButtonState("btn-" + name, features[name]);
    savePrefs();
  }

  function updateButtonState(btnId, mode) {
    const btn = document.getElementById(btnId);
    if (!btn) return;
    const status = btn.querySelector(".btn-status");
    if (mode === "default") {
      btn.classList.remove("active");
      if (status) status.textContent = "OFF";
    } else {
      btn.classList.add("active");
      if (status) status.textContent = mode.replace("_", ".");
    }
  }

  function featureToClass(feature) {
    const map = {
      highlightLinks: "highlight-links",
      textSpacing: "text-spacing",
      pauseAnimations: "pause-animations",
      hideImages: "hide-images",
      dyslexiaFriendly: "dyslexia-friendly",
      largeCursor: "large-cursor",
      showTooltips: "show-tooltips",
    };
    return map[feature] || null;
  }

  // === RESET ALL ===
  window.resetAll = function () {
    for (const key in features)
      features[key] = typeof features[key] === "boolean" ? false : "default";

    document.body.className = document.body.className
      .split(" ")
      .filter(
        (cls) =>
          !cls.startsWith("high-contrast-") &&
          !cls.startsWith("bigger-text-") &&
          !cls.startsWith("line-height-") &&
          !cls.startsWith("text-align-") &&
          !cls.startsWith("saturation-") &&
          ![
            "highlight-links",
            "text-spacing",
            "pause-animations",
            "hide-images",
            "dyslexia-friendly",
            "large-cursor",
            "show-tooltips",
          ].includes(cls)
      )
      .join(" ");

    if (window.speechSynthesis) window.speechSynthesis.cancel();
    document.querySelectorAll(".accessibility-grid button").forEach((b) => {
      b.classList.remove("active");
      const s = b.querySelector(".btn-status");
      if (s) s.textContent = "OFF";
    });

    localStorage.removeItem(storageKey);
  };

  // === TEXT TO SPEECH ===
  function handleTextToSpeech(enabled, autoStart = false) {
    if (!window.speechSynthesis) {
      alert("Text-to-speech not supported on this browser.");
      return;
    }

    window.speechSynthesis.cancel();
    document.body.removeEventListener("click", readOnClick);

    if (enabled) {
      if (autoStart) {
        setTimeout(() => readVisibleContent(), 600);
      }
      setTimeout(() => {
        document.body.addEventListener("click", readOnClick);
      }, 800);
    }
  }

  // === IMPROVED: Read only meaningful visible content ===
  function readVisibleContent() {
    const clone = document.body.cloneNode(true);

    // Remove unnecessary nodes
    clone.querySelectorAll("script, style, noscript, .accessibility-widget, .accessibility-toggle-btn").forEach(el => el.remove());

    // Remove hidden elements
    clone.querySelectorAll("*").forEach(el => {
      const style = window.getComputedStyle(el);
      if (style.display === "none" || style.visibility === "hidden" || style.opacity === "0") el.remove();
    });

    const readableTags = ["h1","h2","h3","h4","h5","h6","p","a","button","label","span","li","strong","em"];
    let text = "";
    readableTags.forEach(tag => {
      clone.querySelectorAll(tag).forEach(el => {
        const content = (el.innerText || el.textContent || "").trim();
        if (content && content.length > 2) text += content + ". ";
      });
    });

    text = text.replace(/\s+/g, " ").trim();
    if (text) {
      window.speechSynthesis.cancel();
      const utter = new SpeechSynthesisUtterance(text);
      utter.lang = "en-US";
      utter.rate = 1;
      utter.pitch = 1;
      window.speechSynthesis.speak(utter);
    }
  }

  // === IMPROVED: Read only clicked / selected content ===
  function readOnClick(e) {
    const target = e.target.closest("button, a, input, textarea, select, [role], [aria-label]");
    let text = "";

    if (target) {
      text =
        target.getAttribute("aria-label") ||
        target.getAttribute("alt") ||
        target.innerText ||
        target.value ||
        "";
    } else {
      const elText = e.target.innerText || e.target.textContent;
      if (elText && elText.trim().length > 2) text = elText;
    }

    text = text.trim();
    if (!text) return;

    window.speechSynthesis.cancel();
    const utter = new SpeechSynthesisUtterance(text);
    utter.lang = "en-US";
    utter.rate = 1;
    utter.pitch = 1;
    window.speechSynthesis.speak(utter);
  }

  // === STORAGE ===
  function savePrefs() {
    localStorage.setItem(storageKey, JSON.stringify(features));
  }

  function loadPrefs() {
    const saved = localStorage.getItem(storageKey);
    if (!saved) return;
    Object.assign(features, JSON.parse(saved));

    for (const [key, val] of Object.entries(features)) {
      // === Apply effects to body ===
      if (typeof val === "boolean" && val) {
        const cls = featureToClass(key);
        if (cls) document.body.classList.add(cls);
        if (key === "textToSpeech") handleTextToSpeech(true, true);
      } else if (val !== "default") {
        const prefix = {
          highContrast: "high-contrast-",
          biggerText: "bigger-text-",
          lineHeight: "line-height-",
          textAlign: "text-align-",
          saturation: "saturation-",
        }[key];
        if (prefix) document.body.classList.add(prefix + val);
      }

      // === Update button visuals ===
      const btn = document.getElementById("btn-" + key);
      if (!btn) continue;
      const status = btn.querySelector(".btn-status");

      if (typeof val === "boolean") {
        // handle toggle buttons like highlightLinks, textSpacing, etc.
        btn.classList.toggle("active", val);
        if (status) status.textContent = val ? "ON" : "OFF";
      } else if (val === "default") {
        btn.classList.remove("active");
        if (status) status.textContent = "OFF";
      } else {
        // handle cycling options like biggerText, highContrast, etc.
        btn.classList.add("active");
        if (status) status.textContent = val.replace("_", ".");
      }
    }
  }

  window.addEventListener("pageshow", () => {
    const saved = JSON.parse(localStorage.getItem("accessibilityPrefs") || "{}");
    if (saved.textToSpeech) handleTextToSpeech(true, true);
  });

})();
