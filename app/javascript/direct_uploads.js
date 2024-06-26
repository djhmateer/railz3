// https://edgeguides.rubyonrails.org/active_storage_overview.html#direct-upload-javascript-events

document.addEventListener("direct-upload:initialize", event => {
    console.log("direct-upload:initialize")
    const { target, detail } = event
    const { id, file } = detail
    target.insertAdjacentHTML("beforebegin", `
      <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
        <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 10%"></div>
        <span class="direct-upload__filename">${file.name}</span>
      </div>
    `)
  })
  
  document.addEventListener("direct-upload:start", event => {
    console.log("direct-upload:start")
    const { id } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.remove("direct-upload--pending")
  })
  
  document.addEventListener("direct-upload:progress", event => {
    console.log("direct-upload:progress")
    const { id, progress } = event.detail
    const progressElement = document.getElementById(`direct-upload-progress-${id}`)
    // progressElement.style.width = `${progress}%`
    progressElement.style.width = progress + '%'
  })
  
  document.addEventListener("direct-upload:error", event => {
    console.log("direct-upload:error")
    event.preventDefault()
    const { id, error } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.add("direct-upload--error")
    element.setAttribute("title", error)
  })
  
  document.addEventListener("direct-upload:end", event => {
    console.log("direct-upload:end")
    const { id } = event.detail
    const element = document.getElementById(`direct-upload-${id}`)
    element.classList.add("direct-upload--complete")
  })
  