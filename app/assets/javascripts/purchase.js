document.addEventListener('turbo:load', function () {
    const initializeStripeElements = () => {
        const stripe = Stripe("pk_test_51OCmKBADrketNTILoXzoO6z0cHarFcSKkEh60kud4JpBl7eahSXdwz3eDMZR6xQccU8U3sUpIk94xCeo7OR6xE8e00tgApvBAf");
        const elements = stripe.elements();
        const cardElement = elements.create('card');
        cardElement.mount("#card-element");

        const form = $('#purchase-form');
        form.on('submit', async (event) => {
            event.preventDefault();

            const { token, error } = await stripe.createToken(cardElement);

            if (error) {
                console.error(error);
            } else {
                console.log("Stripe Token:", token.id);

                const hiddenInput = $('<input>').attr({
                    type: 'hidden',
                    name: 'stripe_token',
                    value: token.id,
                });

                form.append(hiddenInput);
                form.get(0).submit();
            }
        });
    };

    // Check if the form and card element are present
    const formAndCardElementPresent = () => {
        return document.getElementById('purchase-form') !== null && document.getElementById('card-element') !== null;
    };

    const observeFormAndCardElement = () => {
        const observer = new MutationObserver(() => {
            if (formAndCardElementPresent()) {
                initializeStripeElements();
                observer.disconnect();
            }
        });

        observer.observe(document.body, { childList: true, subtree: true });
    };

    if (formAndCardElementPresent()) {
        initializeStripeElements();
    } else {
        observeFormAndCardElement();
    }
});

