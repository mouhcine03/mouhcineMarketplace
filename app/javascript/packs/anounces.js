document.addEventListener('DOMContentLoaded', function () {
    // Image gallery functionality for show page
    const mainImage = document.querySelector('.main-image img');
    const thumbnails = document.querySelectorAll('.thumbnail img');

    if (thumbnails.length > 0 && mainImage) {
        thumbnails.forEach(thumbnail => {
            thumbnail.addEventListener('click', function () {
                mainImage.src = this.src;
            });
        });
    }

    // Image preview for form
    const imageInput = document.querySelector('input[type="file"][multiple]');
    const previewContainer = document.querySelector('.image-preview-container');

    if (imageInput && previewContainer) {
        imageInput.addEventListener('change', function () {
            // Clear any existing previews for new uploads
            const newPreviewContainer = document.createElement('div');
            newPreviewContainer.className = 'image-preview-container';

            for (let i = 0; i < this.files.length; i++) {
                const file = this.files[i];
                if (!file.type.match('image.*')) continue;

                const reader = new FileReader();
                reader.onload = function (e) {
                    const previewDiv = document.createElement('div');
                    previewDiv.className = 'image-preview';

                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.className = 'img-thumbnail';

                    previewDiv.appendChild(img);
                    newPreviewContainer.appendChild(previewDiv);
                }

                reader.readAsDataURL(file);
            }

            // Add "New Images" heading if there are files
            if (this.files.length > 0) {
                const newImagesSection = document.createElement('div');
                newImagesSection.className = 'new-images';

                const heading = document.createElement('h4');
                heading.textContent = 'New Images';

                newImagesSection.appendChild(heading);
                newImagesSection.appendChild(newPreviewContainer);

                // Insert after the file upload section
                const uploadSection = document.querySelector('.custom-file-upload').parentNode;
                uploadSection.parentNode.insertBefore(newImagesSection, uploadSection.nextSibling);
            }
        });
    }

    // Remove image functionality
    const removeButtons = document.querySelectorAll('.remove-image');

    if (removeButtons.length > 0) {
        removeButtons.forEach(button => {
            button.addEventListener('click', function (e) {
                e.preventDefault();

                const imageId = this.dataset.imageId;
                if (!imageId) return;

                // Create a hidden field to mark this image for deletion
                const hiddenField = document.createElement('input');
                hiddenField.type = 'hidden';
                hiddenField.name = 'anounce[remove_images][]';
                hiddenField.value = imageId;

                document.querySelector('form').appendChild(hiddenField);

                // Hide the preview
                this.closest('.image-preview').style.display = 'none';
            });
        });
    }
});