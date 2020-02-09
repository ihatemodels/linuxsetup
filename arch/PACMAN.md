# pacman package manager cheat sheet


<table>
  <thead>
    <tr>
      <th>Command</th>
      <th>Description</th>
    </tr>
  </thead>
    <tbody>
      <tr>
        <td><code>pacman -Syu &lt;pkg&gt;</code></td>
        <td>Install (and update package list)</td>
      </tr>
      <tr>
        <td><code>pacman -S &lt;pkg&gt;</code></td>
        <td>Install only</td>
      </tr>
      <tr>
        <td><code>pacman -Rsc &lt;pkg&gt;</code></td>
        <td>Uninstall</td>
      </tr>
      <tr>
        <td><code>pacman -Ss &lt;keywords&gt;</code></td>
        <td>Search</td>
      </tr>
      <tr>
        <td><code>pacman -Syu</code></td>
        <td>Upgrade everything</td>
      </tr>
    </tbody>
</table>


<h3>Query</h3>
<table>
  <thead>
    <tr>
      <th>Command</th>
      <th>Description</th>
    </tr>
  </thead>
<tbody>
<tr>
<td><code>pacman -Qe</code></td>
<td>List explictly-installed packages</td>
</tr>
</tbody>
<tbody>
<tr>
<td><code>pacman -Ql &lt;pkg&gt;</code></td>
<td>What files does this package have?</td>
</tr>
<tr>
<td><code>pacman -Qii &lt;pkg&gt;</code></td>
<td>List information on package</td>
</tr>
</tbody>
<tbody>
<tr>
<td><code>pacman -Qo &lt;file&gt;</code></td>
<td>Who owns this file?</td>
</tr>
</tbody>
<tbody>
<tr>
<td><code>pacman -Qs &lt;query&gt;</code></td>
<td>Search installed packages for keywords</td>
</tr>
</tbody>
</table>
<h3 id="orphans">Orphans</h3>
<table>
<thead>
<tr>
<th>Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>pacman -Qdt</code></td>
<td>List unneeded packages</td>
</tr>
<tr>
<td><code>pacman -Rns $(pacman -Qdtq)</code></td>
<td>Uninstall unneeded packages</td>
</tr>
</tbody>
</table>
<p>Avoid orphans by using <code>pacman -Rsc</code> to remove packages, which will remove unneeded dependencies.</p>
<h3 id="other">Other</h3>
<table>
<thead>
<tr>
<th>Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>pactree &lt;pkg&gt;</code></td>
<td>What does <em>pkg</em> depend on?</td>
</tr>
<tr>
<td><code>pactree -r &lt;pkg&gt;</code></td>
<td>What depends on <em>pkg</em>?</td>
</tr>
</tbody>
</table>
