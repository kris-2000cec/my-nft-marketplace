function App() {

  const connectWallet = async () => {
    if (window.ethereum) {
      const accounts = await window.ethereum.request({
        method: "eth_requestAccounts"
      });
      alert("Wallet Connected: " + accounts[0]);
    } else {
      alert("Please install MetaMask");
    }
  };

  return (
    <div style={{ padding: "40px", fontFamily: "Arial" }}>
      <h1>NFT Marketplace</h1>
      <p>Welcome to my decentralized NFT marketplace project.</p>
      <button onClick={connectWallet}>Connect Wallet</button>
    </div>
  );
}

export default App;

